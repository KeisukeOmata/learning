FROM node:12.18.4 AS nodejs

# 作業用（working）ディレクトリを指定
WORKDIR /tmp

# Node.jsのダウンロード
RUN curl -LO https://nodejs.org/dist/v12.18.4/node-v12.18.4-linux-x64.tar.xz
RUN tar xvf node-v12.18.4-linux-x64.tar.xz
RUN mv node-v12.18.4-linux-x64 node

FROM node:12.18.4

# node.jsをコピー
COPY --from=nodejs /tmp/node /opt/node
ENV PATH /opt/node/bin:$PATH

# yarnのインストール
RUN curl -o- -L https://yarnpkg.com/install.sh | bash
ENV PATH /root/.yarn/bin:/root/.config/yarn/global/node_modules/.bin:$PATH

# redux、nextのインストール
# warningが見辛いので分けて記述
RUN npm init -y
RUN npm install --save redux
RUN npm install --save react-redux
RUN npm install --save-dev redux-devtools
RUN npm install --save redux-persist
RUN npm install --save redux-thunk
RUN npm install --save next
RUN npm install --save react
RUN npm install --save react-dom
RUN npm install --save firebase

# アップデートとvimのインストール
RUN apt-get update;apt-get install -y vim
RUN yarn install

# 作業用（working）ディレクトリを指定
WORKDIR /app

# 実行時、コマンド指定がない場合に実行されるコマンド
CMD ["bash"]