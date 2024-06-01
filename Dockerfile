FROM openjdk:11
RUN addgroup -S nonroot \
    && adduser -S nonroot -G nonroot
USER nonroot
WORKDIR /app
ADD jarstaging/com/valaxy/demo-workshop/2.1.2/demo-workshop-2.1.2.jar demo-workshop.jar 
ENTRYPOINT [ "java", "jar", "demo-workshop.jar" ]