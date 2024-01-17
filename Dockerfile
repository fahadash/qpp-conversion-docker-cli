FROM opensuse/leap

RUN zypper --non-interactive update

RUN zypper --non-interactive install java maven git

RUN git clone https://github.com/CMSgov/qpp-conversion-tool.git /qpp-conversion-tool

WORKDIR /qpp-conversion-tool

RUN ./convert.sh

COPY qpp.sh /qpp.sh

RUN chmod +x /qpp.sh
