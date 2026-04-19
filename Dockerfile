FROM ubuntu:latest AS build

WORKDIR /app

RUN apt-get update && apt-get install -y build-essential

COPY main.cpp .

RUN g++ -o hello main.cpp -static

FROM scratch

COPY --from=build /app/hello /hello

RUN ["/hello"]
