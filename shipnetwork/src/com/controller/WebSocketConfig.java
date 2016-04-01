package com.controller;

import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.converter.MessageConverter;
import org.springframework.messaging.handler.invocation.HandlerMethodArgumentResolver;
import org.springframework.messaging.handler.invocation.HandlerMethodReturnValueHandler;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketTransportRegistration;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> arg0) {
		
	}

	@Override
	public void addReturnValueHandlers(List<HandlerMethodReturnValueHandler> arg0) {
		
	}

	@Override
	public void configureClientInboundChannel(ChannelRegistration arg0) {
		arg0.taskExecutor().corePoolSize(4) //设置消息输入通道的线程池线程数
        .maxPoolSize(8)//最大线程数
        .keepAliveSeconds(60);//线程活动时间
	}

	@Override
	public void configureClientOutboundChannel(ChannelRegistration arg0) {
		arg0.taskExecutor().corePoolSize(4).maxPoolSize(8);
	}

	@Override
	public void configureMessageBroker(MessageBrokerRegistry arg0) {
		arg0.setApplicationDestinationPrefixes("/ws");
		arg0.enableSimpleBroker("/broker");
	}

	@Override
	public boolean configureMessageConverters(List<MessageConverter> arg0) {
		return true;
	}

	@Override
	public void configureWebSocketTransport(WebSocketTransportRegistration arg0) {
		arg0.setMessageSizeLimit(8192) //设置消息字节数大小
        .setSendBufferSizeLimit(8192)//设置消息缓存大小
        .setSendTimeLimit(10000); //设置消息发送时间限制毫秒
	}

	@Override
	public void registerStompEndpoints(StompEndpointRegistry arg0) {
		System.out.println("1233");
		arg0.addEndpoint("/websocket").setAllowedOrigins("*").withSockJS();
	}

	
}
