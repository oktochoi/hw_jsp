FROM tomcat:9.0-jdk17

# JSP 파일 복사
COPY ./src/main/webapp/ /usr/local/tomcat/webapps/ROOT/

# Railway가 제공하는 PORT를 Tomcat이 사용하도록 자동 패치
CMD ["sh", "-c", "sed -i \"s/8080/${PORT}/\" /usr/local/tomcat/conf/server.xml && catalina.sh run"]
