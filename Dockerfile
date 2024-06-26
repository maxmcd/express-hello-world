FROM node:20

RUN apt-get update \
    && apt-get install -y \
        apache2-utils \
        lsb-release \
        python3 \
    && apt-get clean all \
    && mkdir -p --mode=0755 /usr/share/keyrings \
    && curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null \
    && echo "deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/cloudflared.list \
    && apt-get update && apt-get install cloudflared && apt-get clean all \
    && cloudflared --version

COPY . .

RUN npm i

CMD node index.js