# 베이스 이미지 OpenJDK 설정
## 현재 개발환경 수준이기에 경량화 수준이 높은 alpine 이미지로 선정함.
FROM bellsoft/liberica-openjdk-alpine:17 as builder

# JAR/WAR 파일의 위치에 따른 변수 설정
ARG WAR_FILE=./build/libs/*.war

ARG PROFILES
ARG ENV
COPY ${WAR_FILE} app.war

ENTRYPOINT ["java", "-Dspring.profiles.active=${PROFILES}", "-Dserver.env=${ENV}", "-jar", "app.war"]