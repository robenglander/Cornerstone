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

package com.paxxis.chime.client.common;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Robert Englander
 */
public class UserMessage implements Serializable {
	private static final long serialVersionUID = 1L;

    private InstanceId id;
    private String subject;
    private String body;
    private Date timestamp;
    private boolean seen;

    public UserMessage() {
    }

    public UserMessage(InstanceId id, String subject, String body, Date timestamp, boolean seen) {
        this.id = id;
        this.subject = subject;
        this.body = body;
        this.timestamp = timestamp;
        this.seen = seen;
    }

    public InstanceId getId() {
        return id;
    }

    public String getSubject() {
        return subject;
    }

    public String getBody() {
        return body;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public boolean isSeen() {
        return seen;
    }
}
