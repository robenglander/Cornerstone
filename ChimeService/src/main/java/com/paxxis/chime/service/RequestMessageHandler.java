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

import com.paxxis.chime.client.common.AddCommentRequest;
import com.paxxis.chime.client.common.ApplyReviewRequest;
import com.paxxis.chime.client.common.ApplyTagRequest;
import com.paxxis.chime.client.common.ApplyVoteRequest;
import com.paxxis.chime.client.common.BuildIndexRequestMessage;
import com.paxxis.chime.client.common.CommentsRequest;
import com.paxxis.chime.client.common.CreateDiscussionRequest;
import com.paxxis.chime.client.common.DataInstanceRequest;
import com.paxxis.chime.client.common.DiscussionsRequest;
import com.paxxis.chime.client.common.EditCommunityRequest;
import com.paxxis.chime.client.common.EditDataInstanceRequest;
import com.paxxis.chime.client.common.EditShapeRequest;
import com.paxxis.chime.client.common.EditUserRequest;
import com.paxxis.chime.client.common.FindInstancesRequest;
import com.paxxis.chime.client.common.FindShapesRequest;
import com.paxxis.chime.client.common.FindTagsRequest;
import com.paxxis.chime.client.common.LockRequest;
import com.paxxis.chime.client.common.LoginRequest;
import com.paxxis.chime.client.common.LogoutRequest;
import com.paxxis.chime.client.common.MessagingConstants;
import com.paxxis.chime.client.common.ModifyShapeRequest;
import com.paxxis.chime.client.common.MultiRequest;
import com.paxxis.chime.client.common.PingRequest;
import com.paxxis.chime.client.common.ReviewsRequest;
import com.paxxis.chime.client.common.RunCALScriptRequest;
import com.paxxis.chime.client.common.ShapeRequest;
import com.paxxis.chime.client.common.SubscribeRequest;
import com.paxxis.chime.client.common.UserContextRequest;
import com.paxxis.chime.client.common.UserMessagesRequest;
import com.paxxis.chime.client.common.MessagingConstants.PayloadType;
import com.paxxis.chime.common.JavaObjectPayload;
import com.paxxis.chime.common.MessagePayload;
import com.paxxis.chime.data.CacheManager;
import com.paxxis.chime.database.DatabaseConnectionPool;
import com.paxxis.chime.indexing.BuildIndexRequestProcessor;

/**
 * 
 * @author Robert Englander
 */
public class RequestMessageHandler extends ServiceBusMessageHandler {
    private static final Logger _logger = Logger.getLogger(RequestMessageHandler.class);

    // the database connection pool
    private DatabaseConnectionPool _databasePool;
    private LdapContextFactory _ldapContextFactory;

    // the topic sender to use to send events 
    NotificationTopicSender _topicSender = null;
    
    private static final HashMap<PayloadType, MessagePayload> _payloadTypes = new HashMap<PayloadType, MessagePayload>();
    private static final HashMap<Integer, Integer> _messageTypes = new HashMap<Integer, Integer>();

    static
    {
        _payloadTypes.put(MessagingConstants.PayloadType.JavaObjectPayload, new JavaObjectPayload());

        _messageTypes.put(LoginRequest.messageType(), LoginRequest.messageVersion());
        _messageTypes.put(LogoutRequest.messageType(), LogoutRequest.messageVersion());
        _messageTypes.put(ShapeRequest.messageType(), ShapeRequest.messageVersion());
        _messageTypes.put(DataInstanceRequest.messageType(), DataInstanceRequest.messageVersion());
        _messageTypes.put(EditShapeRequest.messageType(), EditShapeRequest.messageVersion());
        _messageTypes.put(ModifyShapeRequest.messageType(), ModifyShapeRequest.messageVersion());
        _messageTypes.put(EditDataInstanceRequest.messageType(), EditDataInstanceRequest.messageVersion());
        _messageTypes.put(ApplyReviewRequest.messageType(), ApplyReviewRequest.messageVersion());
        _messageTypes.put(AddCommentRequest.messageType(), AddCommentRequest.messageVersion());
        _messageTypes.put(ApplyTagRequest.messageType(), ApplyTagRequest.messageVersion());
        _messageTypes.put(UserContextRequest.messageType(), UserContextRequest.messageVersion());
        _messageTypes.put(FindTagsRequest.messageType(), FindTagsRequest.messageVersion());
        _messageTypes.put(FindShapesRequest.messageType(), FindShapesRequest.messageVersion());
        _messageTypes.put(MultiRequest.messageType(), MultiRequest.messageVersion());
        _messageTypes.put(FindInstancesRequest.messageType(), FindInstancesRequest.messageVersion());
        _messageTypes.put(ReviewsRequest.messageType(), ReviewsRequest.messageVersion());
        _messageTypes.put(CommentsRequest.messageType(), CommentsRequest.messageVersion());
        _messageTypes.put(DiscussionsRequest.messageType(), DiscussionsRequest.messageVersion());
        _messageTypes.put(ApplyVoteRequest.messageType(), ApplyVoteRequest.messageVersion());
        _messageTypes.put(CreateDiscussionRequest.messageType(), CreateDiscussionRequest.messageVersion());
        _messageTypes.put(BuildIndexRequestMessage.messageType(), BuildIndexRequestMessage.messageVersion());
        _messageTypes.put(PingRequest.messageType(), PingRequest.messageVersion());
        _messageTypes.put(LockRequest.messageType(), LockRequest.messageVersion());
        _messageTypes.put(SubscribeRequest.messageType(), SubscribeRequest.messageVersion());
        _messageTypes.put(RunCALScriptRequest.messageType(), RunCALScriptRequest.messageVersion());
        _messageTypes.put(EditUserRequest.messageType(), EditUserRequest.messageVersion());
        _messageTypes.put(EditCommunityRequest.messageType(), EditCommunityRequest.messageVersion());
        _messageTypes.put(UserMessagesRequest.messageType(), UserMessagesRequest.messageVersion());
        
        CacheManager.instance();
    }
    
    public MessageProcessor getProcessor(int type, int version, int payloadType)
    {
        PayloadType ptype = PayloadType.valueOf(payloadType);
        MessagePayload mPayload = _payloadTypes.get(ptype);
        if (_payloadTypes.containsKey(ptype))
        {
            if (_messageTypes.containsKey(type))
            {
                int ver = _messageTypes.get(type);
                if (version == ver)
                {
                    if (type == LoginRequest.messageType())
                    {
                        return new LoginRequestProcessor(mPayload, _databasePool, _ldapContextFactory, _topicSender);
                    }
                    else if (type == LogoutRequest.messageType())
                    {
                        return new LogoutRequestProcessor(mPayload, _databasePool);
                    }
                    else if (type == ShapeRequest.messageType())
                    {
                        return new ShapeRequestProcessor(mPayload, _databasePool);
                    }
                    else if (type == DataInstanceRequest.messageType())
                    {
                        return new DataInstanceRequestProcessor(mPayload, _databasePool);
                    }
                    else if (type == EditShapeRequest.messageType())
                    {
                        return new EditShapeRequestProcessor(mPayload, _databasePool, _topicSender);
                    }
                    else if (type == ModifyShapeRequest.messageType())
                    {
                        return new ModifyShapeRequestProcessor(mPayload, _databasePool, _topicSender);
                    }
                    else if (type == EditDataInstanceRequest.messageType())
                    {
                        return new EditDataRequestProcessor(mPayload, _databasePool, _topicSender);
                    }
                    else if (type == ApplyVoteRequest.messageType())
                    {
                        return new ApplyVoteRequestProcessor(mPayload, _databasePool, _topicSender);
                    }
                    else if (type == ApplyReviewRequest.messageType())
                    {
                        return new ApplyReviewRequestProcessor(mPayload, _databasePool, _topicSender);
                    }
                    else if (type == AddCommentRequest.messageType())
                    {
                        return new AddCommentRequestProcessor(mPayload, _databasePool, _topicSender);
                    }
                    else if (type == ApplyTagRequest.messageType())
                    {
                        return new ApplyTagRequestProcessor(mPayload, _databasePool, _topicSender);
                    }
                    else if (type == UserContextRequest.messageType())
                    {
                        return new UserContextRequestProcessor(mPayload, _databasePool);
                    }
                    else if (type == FindTagsRequest.messageType())
                    {
                        return new FindTagsRequestProcessor(mPayload, _databasePool);
                    }
                    else if (type == FindShapesRequest.messageType())
                    {
                        return new FindShapesRequestProcessor(mPayload, _databasePool);
                    }
                    else if (type == FindInstancesRequest.messageType())
                    {
                        return new FindInstancesRequestProcessor(mPayload, _databasePool);
                    }
                    else if (type == ReviewsRequest.messageType())
                    {
                        return new ReviewsRequestProcessor(mPayload, _databasePool);
                    }
                    else if (type == CommentsRequest.messageType())
                    {
                        return new CommentsRequestProcessor(mPayload, _databasePool);
                    }
                    else if (type == DiscussionsRequest.messageType())
                    {
                        return new DiscussionsRequestProcessor(mPayload, _databasePool);
                    }
                    else if (type == CreateDiscussionRequest.messageType())
                    {
                        return new CreateDiscussionRequestProcessor(mPayload, _databasePool, _topicSender);
                    }
                    else if (type == MultiRequest.messageType())
                    {
                        MultiRequestProcessor proc = new MultiRequestProcessor(mPayload, _databasePool);
                        proc.setMessageHandler(this);
                        return proc;
                    }
                    else if (type == PingRequest.messageType())
                    {
                        return new PingRequestProcessor(mPayload, _databasePool);
                    }
                    else if (type == LockRequest.messageType())
                    {
                        return new LockRequestProcessor(mPayload, _databasePool, _topicSender);
                    }
                    else if (type == SubscribeRequest.messageType())
                    {
                        return new SubscribeRequestProcessor(mPayload, _databasePool, _topicSender);
                    }
                    else if (type == RunCALScriptRequest.messageType())
                    {
                        return new RunCALScriptRequestProcessor(mPayload, _databasePool);
                    }
                    else if (type == BuildIndexRequestMessage.messageType())
                    {
                        return new BuildIndexRequestProcessor(mPayload, _databasePool, _topicSender);
                    }
                    else if (type == EditUserRequest.messageType())
                    {
                        return new EditUserRequestProcessor(mPayload, _databasePool, _topicSender);
                    }
                    else if (type == EditCommunityRequest.messageType())
                    {
                        return new EditCommunityRequestProcessor(mPayload, _databasePool, _topicSender);
                    }
                    else if (type == UserMessagesRequest.messageType())
                    {
                        return new UserMessagesRequestProcessor(mPayload, _databasePool);
                    }
                }
            }
        }
        
        _logger.warn("Unsupported message routed to message handler {"
                +type+ "," +version+ "," +payloadType+ ")");
        return new ErrorProcessor(mPayload);
    }

    public void setConnectionPool(DatabaseConnectionPool pool)
    {
        _databasePool = pool;
    }
    
    public void setLdapContextFactory(LdapContextFactory ldapContextFactory) {
		_ldapContextFactory = ldapContextFactory;
	}

	public LdapContextFactory getLdapContextFactory() {
		return _ldapContextFactory;
	}

	public void setEventNotifier(NotificationTopicSender sender)
    {
        _topicSender = sender;
    }
    
}
