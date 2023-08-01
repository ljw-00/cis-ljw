package com.example.demo.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FileUploaderConfig {

    @Value("${file.upload-dir}")
    private String uploadDir;
    
    public String getUploadDir()
    {
        return uploadDir;
    }
}
