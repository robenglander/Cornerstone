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

package com.paxxis.chime.service;

import java.util.HashMap;

import org.apache.log4j.Logger;

import com.paxxis.chime.client.common.BuildIndexRequestMessage;
import com.paxxis.chime.client.common.DataInstanceEvent;
import com.paxxis.chime.client.common.MessagingConstants;
import com.paxxis.chime.client.common.MessagingConstants.PayloadType;
import com.paxxis.chime.common.JavaObjectPayload;
import com.paxxis.chime.common.MessagePayload;
import com.paxxis.chime.database.DatabaseConnectionPool;
import com.paxxis.chime.indexing.BuildIndexRequestProcessor;

/**
 *
 * @author Robert Englander 
 */
public class EventMessageHandler extends ServiceBusMessageHandler {
    private static final Logger _logger = Logger.getLogger(EventMessageHandler.class);

    private static final HashMap<PayloadType, MessagePayload> payloadTypes = new HashMap<PayloadType, MessagePayload>();
    private static final HashMap<Integer, Integer> messageTypes = new HashMap<Integer, Integer>();

    // the topic sender to use to send events
    private NotificationTopicSender topicSender = null;

    // the database connection pool
    private DatabaseConnectionPool databasePool;

    static {
        payloadTypes.put(MessagingConstants.PayloadType.JavaObjectPayload, new JavaObjectPayload());

        messageTypes.put(DataInstanceEvent.messageType(), DataInstanceEvent.messageVersion());
        messageTypes.put(BuildIndexRequestMessage.messageType(), BuildIndexRequestMessage.messageVersion());
    }
    
    public MessageProcessor getProcessor(int type, int version, int payloadType) {
        PayloadType ptype = PayloadType.valueOf(payloadType);
        MessagePayload mPayload = payloadTypes.get(ptype);
        if (payloadTypes.containsKey(ptype)) {
            if (messageTypes.containsKey(type)) {
                int ver = messageTypes.get(type);
                if (version == ver) {
                    if (type == DataInstanceEvent.messageType()) {
                        return new DataInstanceEventProcessor(mPayload, databasePool);
                    } else if (type == BuildIndexRequestMessage.messageType()) {
                        return new BuildIndexRequestProcessor(mPayload, databasePool, topicSender);
                    }
                }
            }
        }
        
        _logger.warn("Unsupported message routed to message handler {"
                +type+ "," +version+ "," +payloadType+ ")");
        return new ErrorProcessor(mPayload);
    }
    
    public void setConnectionPool(DatabaseConnectionPool pool) {
        databasePool = pool;
    }

    public void setEventNotifier(NotificationTopicSender sender) {
        topicSender = sender;
    }
}
