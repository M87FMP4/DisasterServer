FROM ubuntu:22.04 AS builder
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libenet-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .
RUN cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
RUN cmake --build build --config Release -j$(nproc)
RUN ldd /app/build/disasterserver/DisasterServer
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y \
    libenet7 \
    libstdc++6 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY --from=builder /app/build/disasterserver/DisasterServer /app/DisasterServer
RUN mkdir -p /app/config
EXPOSE 8606/udp
CMD ["./DisasterServer"]