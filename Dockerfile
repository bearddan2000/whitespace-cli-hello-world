FROM ubuntu:22.04

WORKDIR /workspace

RUN apt update && apt install -y bison clang flex git llvm make

RUN git clone https://github.com/bvisness/whitespace.git

WORKDIR /workspace/whitespace

RUN make

RUN ln -s /workspace/whitespace/whitespace /bin/ws

WORKDIR /code

COPY bin .

CMD "./run.sh"