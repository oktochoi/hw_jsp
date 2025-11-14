FROM tomcat:9.0-jdk17

# JSP 파일 복사 (ROOT context로 배포)
COPY ./src/main/webapp/ /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080

CMD ["catalina.sh", "run"]
