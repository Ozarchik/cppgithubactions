FROM ubuntu:latest AS build

WORKDIR /app

RUN sudo apt update && sudo apt install -y build-essential

COPY hello.cpp .

RUN g++ -o build/hello main.cpp -static

FROM scratch

COPY --from=build /app/build/hello /hello

EXPOSE ["/hello"]
