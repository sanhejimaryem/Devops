From openjdk:8
copy ./target/achat-2.2.jar achat-2.2.jar
CMD ["java","-jar","achat-2.2.jar"]
