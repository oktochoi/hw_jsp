FROM tomcat:9.0-jdk17

# WAR 파일이 있으면 우선 사용, 없으면 JSP 파일 직접 복사
COPY ./target/W25_22400742_1.war /usr/local/tomcat/webapps/ROOT.war
# 또는 JSP 파일 직접 복사 (WAR 파일이 없을 경우 주석 해제)
# COPY ./src/main/webapp/ /usr/local/tomcat/webapps/ROOT/

# Railway가 제공하는 PORT를 Tomcat이 사용하도록 자동 패치
CMD ["sh", "-c", "sed -i \"s/8080/${PORT:-8080}/\" /usr/local/tomcat/conf/server.xml && catalina.sh run"]
