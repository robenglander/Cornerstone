/*
 * Copyright 2010 the original author or authors.
 * Copyright 2009 Paxxis Technology LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.paxxis.cornerstone.messaging.service;

import java.util.concurrent.RejectedExecutionException;

import com.paxxis.cornerstone.common.BlockingThreadPoolExecutor;
import com.paxxis.cornerstone.messaging.common.Session;
import com.paxxis.cornerstone.service.ShutdownListener;


/**
 * This is a base class for service bus message handlers.  
 *
 * @author Robert Englander
 */
public abstract class ServiceBusMessageHandler extends SimpleServiceBusMessageHandler {
    // the request processor
    private BlockingThreadPoolExecutor _messageProcessor = null;

    // the thread pool size to use when creating
    // request processor instances
    private int _poolSize = 1;
    
    private int maxMessagesInFlight = 0;

    public ServiceBusMessageHandler() {
    }

    protected int getPoolSize() {
        return _poolSize;
    }

    /**
     * Sets the maximum number of messages that can be in flight at any given time.
     */
    public void setMaxMessagesInFlight(int max) throws IllegalArgumentException {
        if (max < 1) {
            throw new IllegalArgumentException("ServiceBusMessageHandler.maxMessagesInFlight must be >= 1.");
        }

        maxMessagesInFlight = max;
    }
    
    /**
     * Sets the value of the poolSize attribute.  The pool size
     * is the number of concurrent threads that will be used by
     * the request processor to process request messages.
     */
    public void setPoolSize(int poolSize) throws IllegalArgumentException {
        if (poolSize < 1) {
            throw new IllegalArgumentException("ServiceBusMessageHandler.poolSize must be >= 1.");
        }

        _poolSize = poolSize;
    }

    public void halt() {
        if (_messageProcessor != null) {
            _messageProcessor.halt();
        }
    }

    /**
     * Initialize the request processor.
     *
     * @param session the JMS session to use for publishing responses.
     *
     * @throws RuntimeException if the message handler was previously
     * initialized and has not been shut down.
     */
    @Override
    public void init(Session session, boolean clientAck) {
        init("unknown", session, clientAck);
    }
    
    public void init(String destinationName, Session session, boolean clientAck) {
        if (_messageProcessor != null) {
            if (!_messageProcessor.isShutdown()) {
                throw new RuntimeException("Attempt to init active message handler");
            }
        }

        super.init(session, clientAck);

        if (_messageProcessor != null) {
            if (_messageProcessor.isHalted()) {
                _messageProcessor.restart();
            }
        } else {
            _messageProcessor = new BlockingThreadPoolExecutor();
            _messageProcessor.setThreadPoolName(destinationName);
            _messageProcessor.setPoolSize(_poolSize);
            _messageProcessor.setMaxRunnables(maxMessagesInFlight);
            _messageProcessor.initialize();
        }
    }

    /**
     * Submit a request for processing.  The request is queued up
     * and will be processed asynchronously.
     *
     * @param request the request to be processed
     *
     * @throws java.util.concurrent.RejectedExecutionException if the message handler
     * can not accept requests.
     *
     */
    protected void submit(Runnable request) throws RejectedExecutionException {
        _messageProcessor.submit(request);
    }

    /**
     * Initiate a shutdown of the message handler.  All unprocessed requests
     * will be processed before the shutdown is completed.
     *
     * @param listener a reference to a listener that will be informed when
     * the shutdown is complete.
     *
     */
    public void shutdown(ShutdownListener listener) {
        _messageProcessor.shutdown(listener);
    }
}
