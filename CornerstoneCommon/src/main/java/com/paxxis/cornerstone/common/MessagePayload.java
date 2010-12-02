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

package com.paxxis.cornerstone.common;

import com.paxxis.cornerstone.base.MessagingConstants.PayloadType;

import javax.jms.Message;
import javax.jms.Session;

/**
 *
 * @author Robert Englander
 */
public interface MessagePayload {
    public abstract Object getPayload(Message msg);
    public abstract Message createMessage(Session session, Object data);
    public abstract Message createMessage(Session session);
    public abstract PayloadType getType();
}