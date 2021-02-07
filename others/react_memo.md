# 1.dokerfile, docker-compose.ymlをフォルダに用意
# 2.コンテナ作成
docker-compose run --service-ports app
# 3.アプリ作成
yarn create next-app hoge
# 4.typescriptをインストール
touch tsconfig.json  
mv pages/index.js pages/index.tsx  
mv pages/_app.js pages/_app.tsx  
yarn add -D typescript @types/react @types/node
# 各種インストール
# tailwind
yarn add -D tailwindcss  
yarn tailwindcss init  
yarn add -D postcss-preset-env  
yarn add -D postcss  
yarn add -D @tailwindcss/ui  
PostCSS Language Support
# prettier
yarn add -D prettier  
touch .prettierrc.js
# eslint
yarn add -D eslint eslint-plugin-react \
eslint-config-prettier eslint-plugin-prettier \
@typescript-eslint/parser @typescript-eslint/eslint-plugin  
touch .eslintrc.js  
yarn add -D eslint-plugin-jsx-a11y  
yarn add -D stylelint stylelint-config-standard
# huskey
yarn add lint-staged  
yarn add husky
# jest
yarn add -D jest identity-obj-proxy ts-jest @types/jest  
touch jest.config.js
# cypress
yarn add -D cypress  
yarn run cypress open  
find cypress -name "*.js" | sed 'p;s/.js$/.ts/' | xargs -n2 mv  
touch cypress.json  
touch cypress/integration/index_spec.ts  
yarn cypress:open
# pwa
yarn add next-pwa  
touch next.config.js  
yarn add pwacompat
# storybook
yarn add -D @storybook/react @babel/core babel-loader babel-preset-react-app
# package.json
"storybook": "start-storybook -p 6006 -c .storybook"  
mkdir .storybook  
cd .storybook  
main.js, preview.tsをコピーしてくる  
cd src  
mkdir stories  
cd stories  
touch Button.stories.tsx  
