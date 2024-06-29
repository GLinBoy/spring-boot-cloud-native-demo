FROM ghcr.io/graalvm/graalvm-community:22 AS builder
WORKDIR /workspace/app

COPY .mvn .mvn
COPY pom.xml mvnw ./
COPY src src

RUN ./mvnw clean -Pnative native:compile -DskipTests

#FROM --platform=linux/amd64 container-registry.oracle.com/os/oraclelinux:9-slim AS runner
FROM ubuntu:24.04 AS runner

COPY --from=builder /workspace/app/target/function /app/
RUN chmod +x /app/function

ENTRYPOINT ["./app/function"]