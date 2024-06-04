FROM opensuse/leap

RUN zypper --non-interactive update

RUN zypper --non-interactive install java maven git

RUN git clone https://github.com/CMSgov/qpp-conversion-tool.git /qpp-conversion-tool

WORKDIR /qpp-conversion-tool

RUN ./convert.sh

COPY qpp.sh /qpp.sh

RUN chmod +x /qpp.sh

RUN awk '!/server.port|server.ssl.key-store-type/' /qpp-conversion-tool/rest-api/src/main/resources/application.properties > tmpfile && mv tmpfile /qpp-conversion-tool/rest-api/src/main/resources/application.properties


ENTRYPOINT ["/qpp.sh"]