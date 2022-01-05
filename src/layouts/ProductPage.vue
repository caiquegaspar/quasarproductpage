<template>
  <div>
    <q-layout view="hHh LpR fFf">
      <q-header elevated reveal class="bg-white">
        <q-toolbar class="q-px-xl">
          <q-toolbar-title class="text-italic text-dark">
            <q-img
              width="30px"
              height="30px"
              src="https://cdn.quasar.dev/logo-v2/svg/logo.svg"
            />
            Quasar Shop {{ $q.version }}
          </q-toolbar-title>

          <q-breadcrumbs class="text-grey">
            <template v-slot:separator>
              <q-icon size="0" name="chevron_right" class="text-grey" />
            </template>

            <q-breadcrumbs-el icon="home" label="Home" to="/" />
            <q-breadcrumbs-el label="Categoria 1" to="/start" />
            <q-breadcrumbs-el label="Categoria 2" to="/vue-components" />
            <q-breadcrumbs-el
              label="Lista de desejos"
              icon="favorite_border"
              to="/route1"
            />
            <q-breadcrumbs-el
              label="Carrinho"
              icon="shopping_basket"
              to="/route2"
            />
          </q-breadcrumbs>
        </q-toolbar>
        <div class="relative-position">
          <q-linear-progress size="20px" :value="progress" color="accent">
          </q-linear-progress>
          <div class="absolute-full flex flex-start">
            <div
              class="relative-position flex flex-center"
              :style="`width: ${progress * 100}%;`"
            >
              {{ progressLabel }}
            </div>
          </div>
        </div>
      </q-header>

      <q-page-container class="q-px-xl flex justify-center">
        <router-view />
      </q-page-container>

      <footer>
        <div class="bg-grey-2 text-grey column justify-center q-pt-md q-pb-lg">
          <div class="text-h6 q-mb-md text-center">
            Se inscreva em nossa newsletter
          </div>
          <div class="row justify-center">
            <q-input class="q-mx-sm" outlined color="purple" v-model="text" />
            <q-btn class="q-mx-sm" color="purple" label="Inscreva-se" />
          </div>
        </div>
        <div class="bg-grey-4 text-grey q-px-xl q-py-md">
          <div class="flex justify-evenly items-center q-px-lg q-py-xl">
            <div class="col">
              <div class="row justify-center">
                <q-img
                  width="70px"
                  height="70px"
                  src="https://cdn.quasar.dev/logo-v2/svg/logo.svg"
                />
                <div class="q-mx-lg text-weight-bold">
                  <div class="q-py-xs">
                    <span>Nos siga nas redes sociais</span>
                  </div>
                  <div class="row">
                    <q-btn flat class="q-pa-none q-mr-md">
                      <q-img
                        src="https://www.svgrepo.com/show/381685/instagram.svg"
                        :ratio="1"
                        width="30px"
                        height="30px"
                      />
                    </q-btn>
                    <q-btn flat class="q-pa-none q-mr-md">
                      <q-img
                        src="https://www.svgrepo.com/show/124958/facebook.svg"
                        :ratio="1"
                        width="30px"
                        height="30px"
                      />
                    </q-btn>
                    <q-btn flat class="q-pa-none q-mr-md">
                      <q-img
                        src="https://www.svgrepo.com/show/3967/twitter.svg"
                        :ratio="1"
                        width="30px"
                        height="30px"
                      />
                    </q-btn>
                  </div>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="row">
                <div class="q-mx-lg text-weight-bold column items-start">
                  <span class="q-my-xs">Menu</span>
                  <q-btn
                    flat
                    class="q-pa-none q-my-xs text-subtitle2 text-capitalize"
                    style="text-decoration: underline; min-height: 0"
                    color="grey"
                    label="Home"
                  />
                  <q-btn
                    flat
                    class="q-pa-none q-my-xs text-subtitle2 text-capitalize"
                    style="text-decoration: underline; min-height: 0"
                    color="grey"
                    label="Categoria 1"
                  />
                  <q-btn
                    flat
                    class="q-pa-none q-my-xs text-subtitle2 text-capitalize"
                    style="text-decoration: underline; min-height: 0"
                    color="grey"
                    label="Categoria 2"
                  />
                  <q-btn
                    flat
                    class="q-pa-none q-my-xs text-subtitle2 text-capitalize"
                    style="text-decoration: underline; min-height: 0"
                    color="grey"
                    label="Sobre"
                  />
                </div>
                <div class="q-mx-lg text-weight-bold column items-start">
                  <span class="q-my-xs">Contato</span>
                  <q-btn
                    flat
                    class="q-pa-none q-my-xs text-subtitle2 text-capitalize"
                    style="text-decoration: underline; min-height: 0"
                    color="grey"
                    label="Email"
                  />
                  <q-btn
                    flat
                    class="q-pa-none q-my-xs text-subtitle2 text-capitalize"
                    style="text-decoration: underline; min-height: 0"
                    color="grey"
                    label="Sac"
                  />
                  <q-btn
                    flat
                    class="q-pa-none q-my-xs text-subtitle2 text-capitalize"
                    style="text-decoration: underline; min-height: 0"
                    color="grey"
                    label="Chat online"
                  />
                </div>
                <div class="q-mx-lg text-weight-bold column items-start">
                  <span class="q-my-xs">Políticas</span>
                  <q-btn
                    flat
                    class="q-pa-none q-my-xs text-subtitle2 text-capitalize"
                    style="text-decoration: underline; min-height: 0"
                    color="grey"
                    label="Envio"
                  />
                  <q-btn
                    flat
                    class="q-pa-none q-my-xs text-subtitle2 text-capitalize"
                    style="text-decoration: underline; min-height: 0"
                    color="grey"
                    label="Devoluções e reembolsos"
                  />
                  <q-btn
                    flat
                    class="q-pa-none q-my-xs text-subtitle2 text-capitalize"
                    style="text-decoration: underline; min-height: 0"
                    color="grey"
                    label="Política de privacidade"
                  />
                  <q-btn
                    flat
                    class="q-pa-none q-my-xs text-subtitle2 text-capitalize"
                    style="text-decoration: underline; min-height: 0"
                    color="grey"
                    label="Política de cookies"
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      </footer>
    </q-layout>
  </div>
</template>

<script>
import { useMeta } from "quasar";

export default {
  name: "ProductPage",

  setup() {
    useMeta(() => {
      return {
        title: "Quasar Shop",
        meta: {
          description: {
            name: "description",
            content:
              "✓R$15 Off NO PRIMEIRO PEDIDO|Compre calçados, roupas, acessórios da moda e sapatos femininos. Entre na Quasar Shop e boas compras!✓Mais de 500 atualizações diarias",
          },
        },
      };
    });
  },

  data() {
    return {
      text: "",
      progress: 0.7,
      progressLabel: "Faltam apenas R$45,60 para ganhar frete grátis!",
    };
  },
};
</script>
<style>
.shop-container {
  max-width: 1200px
}
</style>
