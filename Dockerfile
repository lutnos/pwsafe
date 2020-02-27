FROM ubuntu

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        checkinstall \
        automake \
        autoconf \
        gcc \
        libssl-dev

COPY . /pwsafe

WORKDIR /pwsafe

RUN aclocal
RUN autoheader
RUN automake  --add-missing
RUN autoconf
RUN ./configure
RUN make
RUN make check
RUN make install


ENTRYPOINT ["pwsafe"]
