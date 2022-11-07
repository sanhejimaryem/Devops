From openjdk:8
copy ./target/achat-1.5.jar achat-1.5.jar
CMD ["java","-jar","achat-1.5.jar"]
