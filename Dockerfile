From openjdk:8
copy ./target/achat-2.3.jar achat-2.3.jar
CMD ["java","-jar","achat-2.3.jar"]
