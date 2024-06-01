FROM open-jdk:17-alpine
USER ubuntu
WORKDIR /app
ADD jarstaging/com/valaxy/demo-workshop/2.1.2/demo-workshop-2.1.2.jar demo-workshop.jar 
ENTRYPOINT [ "java", "jar", "demo-workshop.jar" ]