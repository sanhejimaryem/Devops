From openjdk:8
copy ./target/achat-5.0.jar achat-5.0.jar
CMD ["java","-jar","achat-5.0.jar"]
