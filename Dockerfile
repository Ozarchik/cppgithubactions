FROM ubuntu:latest AS build

WORKDIR /app

RUN apt-get update && apt-get install -y build-essential

COPY main.cpp .

RUN g++ -o build/hello main.cpp -static

FROM scratch

COPY --from=build /app/build/hello /hello

RUN ["/hello"]
