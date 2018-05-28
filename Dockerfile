+FROM debian:stable-slim
+RUN apt update && apt install -yq dnsutils curl
+RUN curl -L -o /app/nstest https://framaclic.org/h/nstest
+
+ENTRYPOINT ["/app/nstest"]
