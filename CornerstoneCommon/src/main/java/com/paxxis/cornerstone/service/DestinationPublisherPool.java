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

package com.paxxis.cornerstone.service;

import javax.jms.Destination;

import com.paxxis.cornerstone.base.RequestMessage;
import com.paxxis.cornerstone.common.MessagePayload;
import com.paxxis.cornerstone.service.ServiceBusSenderPool.PoolEntry;

/**
 * 
 * @author Rob Englander
 */
public class DestinationPublisherPool<T extends DestinationSender> implements DestinationPublisher {

	private ServiceBusSenderPool<T> senderPool;

    /* (non-Javadoc)
     * @see com.paxxis.cornerstone.service.DestinationPublisher#publish(com.paxxis.cornerstone.base.RequestMessage, com.paxxis.cornerstone.common.MessagePayload)
     */
    @Override
    public <REQ extends RequestMessage> void publish(REQ msg, MessagePayload payloadType) {
        PoolEntry<T> entry = senderPool.borrow(this);
        try {
            entry.getSender().publish(msg, payloadType);
        } finally {
            senderPool.returnInstance(entry);
        }
    }

	public ServiceBusSenderPool<T> getSenderPool() {
		return senderPool;
	}
	
    public void setSenderPool(ServiceBusSenderPool<T> senderPool) {
        this.senderPool = senderPool;
    }

	@Override
	public <REQ extends RequestMessage> void publish(Destination dest, REQ msg,
			MessagePayload payloadType) {
        PoolEntry<T> entry = senderPool.borrow(this);
        try {
            entry.getSender().publish(dest, msg, payloadType);
        } finally {
            senderPool.returnInstance(entry);
        }
	}
	
}
