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

import org.apache.log4j.Logger;

import com.paxxis.cornerstone.base.RequestMessage;
import com.paxxis.cornerstone.base.ResponseMessage;
import com.paxxis.cornerstone.common.MessagePayload;

/**
 *
 * @author Robert Englander
 */
public abstract class SimpleMessageProcessor<REQ extends RequestMessage, RESP extends ResponseMessage<REQ>> 
        extends CornerstoneConfigurable implements Runnable {
    
    private static final Logger logger = Logger.getLogger(SimpleMessageProcessor.class);
    
    // the session to use for sending responses
    private javax.jms.Session session;

    // the JMS request message
    private javax.jms.Message message;

    private MessagePayload payloadType;

    private Object _payload = null;

    private boolean clientAck = false;


	public SimpleMessageProcessor() {

	}

    public void setClientAck(boolean ack) {
        clientAck = ack;
    }

    public boolean isClientAck() {
        return clientAck;
    }
    
    public javax.jms.Session getSession() {
        return session;
    }

    public javax.jms.Message getJMSMessage() {
        return message;
    }

    public MessagePayload getPayloadType() {
        return payloadType;
    }

	public void setPayloadType(MessagePayload payloadType) {
		this.payloadType = payloadType;
	}

    public void init(javax.jms.Session session, javax.jms.Message message) {
        this.session = session;
        this.message = message;
    }

    /**
     * Return the request message type this processor can handle...
     * @return
     */
    public abstract Integer getRequestMessageType();
    
    /**
     * Return the request message version this processor can handle...
     * @return
     */
    public abstract Integer getRequestMessageVersion();
    
    /**
     * Return the response message type this processor can handle...
     * @return
     */
    public abstract Integer getResponseMessageType();
    
    /**
     * Return the response message version this processor can handle...
     * @return
     */
    public abstract Integer getResponseMessageVersion();
    
    /**
     * Return the message class this processor is expecting...
     * @return
     */
	public abstract Class<REQ> getRequestMessageClass();
	
    /**
     * Return the message class this processor is expecting...
     * @return
     */
	public abstract Class<RESP> getResponseMessageClass();
	
    protected abstract RESP process(boolean ignorePreviousChanges, Destination replyTo) ;

	protected Object getPayload() {
        if (_payload != null) {
            return _payload;
        } else {
            try {
				return payloadType.getPayload(message);
            } catch (RuntimeException ex) {
                //Logger.getLogger(MessageProcessor.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
        }
    }

    //FIXME this is used in one spot in the whole code base - ChimeService/**/MultiRequestProcessor.java - do we really, really need this?
    public RESP execute(Object payload, boolean ignorePreviousChanges) {
        _payload = payload;
        return process(ignorePreviousChanges, null);
    }

    public com.paxxis.cornerstone.base.Message execute(boolean ignorePreviousChanges) {
        return process(ignorePreviousChanges, null);
    }

    public void run() {
        try {
            // process the request
            execute(false);
        } catch (Exception e) {
            logger.error(e); 
        }
    }
}
