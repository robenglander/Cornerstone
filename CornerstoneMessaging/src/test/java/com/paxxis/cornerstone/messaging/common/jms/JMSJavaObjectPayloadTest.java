package com.paxxis.cornerstone.messaging.common.jms;

import com.paxxis.cornerstone.base.MessagingConstants;
import com.paxxis.cornerstone.messaging.TestMessage;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.modules.junit4.PowerMockRunner;
import static org.mockito.Mockito.*;

import javax.jms.ObjectMessage;
import javax.jms.Session;

import static org.junit.Assert.*;
import static org.junit.Assert.assertEquals;

@RunWith(PowerMockRunner.class)
public class JMSJavaObjectPayloadTest {

    ObjectMessage msg;
    Session session;
    JMSJavaObjectPayload jop;

    @Before
    public void before() throws Exception {
        msg = mock(ObjectMessage.class);
        session = mock(Session.class);
        when(session.createObjectMessage()).thenReturn(msg);
        jop = new JMSJavaObjectPayload(session);
    }

    @Test
    public void testCreateMessage() throws Exception {
        JMSMessage message = jop.createMessage();
        verify(msg).setIntProperty(MessagingConstants.HeaderConstant.PayloadType.name(), jop.getType().getValue());
        assertSame("Incorrect ObjectMessage", msg, message.message);
    }

    @Test
    public void testCreateMessageWithObject() throws Exception {
        TestMessage data = new TestMessage("world", 1000, 2000);
        JMSMessage message = jop.createMessage(data);
        verify(msg).setIntProperty(MessagingConstants.HeaderConstant.PayloadType.name(), jop.getType().getValue());
        verify(msg).setIntProperty(MessagingConstants.HeaderConstant.MessageType.name(), data.getMessageType());
        verify(msg).setIntProperty(MessagingConstants.HeaderConstant.MessageVersion.name(), data.getMessageVersion());
        assertSame("Incorrect ObjectMessage", msg, message.message);
    }
}