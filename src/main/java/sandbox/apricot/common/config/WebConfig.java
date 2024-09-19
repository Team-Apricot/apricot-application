package sandbox.apricot.common.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ContentNegotiationConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {
        // SVG에 대한 MIME 타입을 설정
        configurer.mediaType("svg", org.springframework.http.MediaType.parseMediaType("image/svg+xml"));
    }
}

