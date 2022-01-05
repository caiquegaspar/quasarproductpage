<template>
  <q-page padding class="q-pa-xl shop-container">
    <!-- content -->
    <q-breadcrumbs class="text-grey">
      <template v-slot:separator>
        <q-icon size="1.5em" name="chevron_right" class="text-grey" />
      </template>

      <q-breadcrumbs-el label="Home" to="/" />
      <q-breadcrumbs-el label="Categoria 1" to="/start" />
      <q-breadcrumbs-el
        label="Página do produto"
        style="text-decoration: underline"
      />
    </q-breadcrumbs>

    <section class="q-mt-md row">
      <div class="column items-start" style="width: 50%">
        <div class="relative-position" style="width: 500px; height: 500px">
          <q-img src="~assets/dress.jpg" />
          <q-btn
            class="q-ma-xs absolute-top"
            size="12px"
            color="accent"
            :icon="favorited ? 'favorite' : 'favorite_border'"
            label="Adicionar a lista de desejos"
            @click="showNotif(), (favorited = !favorited)"
          />
          <q-btn
            class="q-ma-xs absolute-bottom-right"
            flat
            round
            color="accent"
            size="20px"
            icon="zoom_in"
            @click="card = true"
          />
        </div>
        <div class="flex justify-between q-mt-md" style="width: 500px">
          <q-img
            src="~assets/dress2.jpg"
            :ratio="1"
            width="110px"
            height="90px"
            @click="card = true"
          >
            <q-btn
              class="absolute-center"
              flat
              round
              color="accent"
              size="25px"
              icon="zoom_in"
            />
          </q-img>
          <q-img
            src="~assets/dress.jpg"
            :ratio="1"
            width="110px"
            height="90px"
            @click="video = true"
          >
            <q-btn flat round color="accent" icon="play_circle" />
          </q-img>
          <q-img
            src="~assets/dress2.jpg"
            :ratio="1"
            width="110px"
            height="90px"
            @click="toolbar = true"
          >
            <q-btn
              class="absolute-center"
              flat
              round
              color="accent"
              size="25px"
              icon="3d_rotation"
            />
          </q-img>
        </div>
      </div>
      <div class="column items-start" style="width: 50%">
        <div>
          <h1 class="text-h4 q-mt-none q-mb-sm">Vestido floral Shein</h1>
          <q-rating
            v-model="ratingModel"
            max="5"
            size="2em"
            color="purple"
            icon="star_border"
            icon-selected="star"
            icon-half="star_half"
            readonly
          />
          <a class="q-ml-md text-purple" href="">Leia as avaliações</a>
        </div>
        <div class="row items-center q-my-lg">
          <div class="row text-weight-medium">
            <span class="text-strike text-grey">R$259</span>
            <q-separator class="q-ma-xs bg-grey-5" vertical size="0.15em" />
            <span class="text-purple">40% off</span>
          </div>
          <h4 class="q-my-none q-mx-md text-weight-bold">R$155,40</h4>
        </div>
        <div class="q-pr-xl text-grey">
          <p>
            O floral vem novamente com tudo neste verão 2022! Os vestidos curtos
            florais super combinam com um belo passeio pela manhã ou à tardinha.
          </p>
        </div>
        <div class="q-my-md">
          <span class="q-mx-xs text-weight-bold">Escolha o tamanho</span>
          <div class="flex items-center">
            <q-select
              outlined
              v-model="size"
              transition-show="scale"
              transition-hide="scale"
              :options="sizeoptions"
              style="width: 200px"
            />
            <div v-if="stock.length" class="relative-position flex q-mx-lg">
              <q-badge align="middle" color="accent" style="height: 34px">{{
                stock
              }}</q-badge>
              <q-icon
                class="absolute"
                size="3em"
                name="arrow_left"
                color="accent"
                style="top: -3px; left: -23px"
              />
            </div>
          </div>
        </div>
        <div class="text-purple">
          <q-icon size="1.5em" name="format_list_numbered" />
          <a class="q-mx-sm" href="">Guia de tamanhos</a>
        </div>
        <div class="column q-mt-lg q-mb-md">
          <span class="q-mx-xs text-weight-bold">Escolha a cor</span>
          <div>
            <q-radio keep-color v-model="color" val="teal" color="teal" />
            <q-radio keep-color v-model="color" val="orange" color="orange" />
            <q-radio keep-color v-model="color" val="red" color="red" />
            <q-radio keep-color v-model="color" val="cyan" color="cyan" />
          </div>
        </div>
        <div class="flex">
          <q-btn
            size="18px"
            class="q-px-xl q-py-xs"
            color="accent"
            label="Adicionar ao carrinho"
          />
        </div>
        <div class="q-my-lg q-mx-sm" style="width: 300px">
          <div class="column items-center justify-center">
            <span class="q-mx-xs text-weight-bold text-grey"
              >Checkout seguro</span
            >
          </div>
          <div>
            <q-separator class="q-ma-xs bg-grey-5" inset size="0.3em" />
          </div>
          <div class="row justify-between">
            <q-img
              src="https://www.svgrepo.com/show/328068/paypal.svg"
              :ratio="1"
              width="50px"
            />
            <q-img
              src="https://www.svgrepo.com/show/328071/visa.svg"
              :ratio="1"
              width="50px"
            />
            <q-img
              src="https://www.svgrepo.com/show/328064/mastercard.svg"
              :ratio="1"
              width="50px"
            />
            <q-img
              src="https://www.svgrepo.com/show/328072/amex.svg"
              :ratio="1"
              width="50px"
            />
          </div>
        </div>
      </div>
    </section>

    <section class="column justify-center q-mt-xl">
      <div>
        <q-tabs
          v-model="tab"
          dense
          no-caps
          class="text-grey"
          active-color="primary"
          indicator-color="primary"
          align="justify"
          narrow-indicator
        >
          <q-tab name="description" label="Descrição" />
          <q-tab name="composition" label="Composição e cuidados" />
          <q-tab name="shop" label="Compras e devoluções" />
          <q-tab name="amostras" label="Amostras grátis" />
        </q-tabs>

        <q-tab-panels class="text-grey q-mx-lg q-my-sm" v-model="tab" animated>
          <q-tab-panel name="description">
            Lorem ipsum dolor sit amet consectetur adipisicing elit.
          </q-tab-panel>

          <q-tab-panel name="composition">
            Lorem ipsum dolor sit amet consectetur adipisicing elit.
          </q-tab-panel>

          <q-tab-panel name="shop">
            Lorem ipsum dolor sit amet consectetur adipisicing elit.
          </q-tab-panel>

          <q-tab-panel name="amostras">
            Lorem ipsum dolor sit amet consectetur adipisicing elit.
          </q-tab-panel>
        </q-tab-panels>
      </div>
      <div class="column justify-center q-my-xl">
        <div class="text-h5 text-center q-mb-xl q-my-lg text-grey">
          Avaliações dos clientes
        </div>
        <div class="row justify-evenly text-grey">
          <q-card flat bordered style="width: 250px; height: 102px">
            <q-card-section horizontal>
              <q-item-section avatar class="q-ml-md">
                <q-avatar>
                  <img src="https://cdn.quasar.dev/img/boy-avatar.png" />
                </q-avatar>
              </q-item-section>
              <q-card-section class="column q-pa-none q-mt-xs">
                <q-rating
                  v-model="ratingModel"
                  class="q-my-sm"
                  max="5"
                  size="1.5em"
                  color="purple"
                  icon="star_border"
                  icon-selected="star"
                  icon-half="star_half"
                  readonly
                />
                <p class="q-mr-md">
                  {{ lorem }}
                </p>
              </q-card-section>
            </q-card-section>
          </q-card>
          <q-card flat bordered style="width: 250px; height: 102px">
            <q-card-section horizontal>
              <q-item-section avatar class="q-ml-md">
                <q-avatar>
                  <img src="https://cdn.quasar.dev/img/avatar5.jpg" />
                </q-avatar>
              </q-item-section>
              <q-card-section class="column q-pa-none q-mt-xs">
                <q-rating
                  v-model="ratingModel"
                  class="q-my-sm"
                  max="5"
                  size="1.5em"
                  color="purple"
                  icon="star_border"
                  icon-selected="star"
                  icon-half="star_half"
                  readonly
                />
                <p class="q-mr-md">
                  {{ lorem }}
                </p>
              </q-card-section>
            </q-card-section>
          </q-card>
          <q-card flat bordered style="width: 250px; height: 102px">
            <q-card-section horizontal>
              <q-item-section avatar class="q-ml-md">
                <q-avatar>
                  <img src="https://cdn.quasar.dev/img/avatar2.jpg" />
                </q-avatar>
              </q-item-section>
              <q-card-section class="column q-pa-none q-mt-xs">
                <q-rating
                  v-model="ratingModel"
                  class="q-my-sm"
                  max="5"
                  size="1.5em"
                  color="purple"
                  icon="star_border"
                  icon-selected="star"
                  icon-half="star_half"
                  readonly
                />
                <p class="q-mr-md">
                  {{ lorem }}
                </p>
              </q-card-section>
            </q-card-section>
          </q-card>
        </div>
      </div>
      <div class="row justify-center">
        <q-separator
          class="q-ma-xl bg-grey-5"
          size="0.1em"
          style="width: 75%"
        />
      </div>
      <div class="column justify-center q-my-md">
        <div class="text-h5 text-center q-mb-xl text-grey">
          Você também pode gostar
        </div>
        <div class="row justify-evenly">
          <q-card class="my-card">
            <q-img
              class="my-card-image"
              src="~assets/dress3.jpg"
              style="width: 180px; height: 250px; transition: all 0.2s"
            >
              <div class="text-weight-bold absolute-bottom text-right">
                Vestido Rosa Floral
              </div>
            </q-img>
          </q-card>
          <q-card class="my-card">
            <q-img
              class="my-card-image"
              src="~assets/pants.jpg"
              style="width: 180px; height: 250px; transition: all 0.2s"
            >
              <div class="text-weight-bold absolute-bottom text-right">
                Calça Pantalona
              </div>
            </q-img>
          </q-card>
          <q-card class="my-card">
            <q-img
              class="my-card-image"
              src="~assets/bag.jpg"
              style="width: 180px; height: 250px; transition: all 0.2s"
            >
              <div class="text-weight-bold absolute-bottom text-right">
                Bolsa Tote com alças
              </div>
            </q-img>
          </q-card>
          <q-card class="my-card">
            <q-img
              class="my-card-image"
              src="~assets/shoes.jpg"
              style="width: 180px; height: 250px; transition: all 0.2s"
            >
              <div class="text-weight-bold absolute-bottom text-right">
                Salto Alto
              </div>
              <div
                class="bg-transparent q-ma-sm flex absolute-top-right text-grey text-caption"
                style="padding: 0 !important"
              >
                <q-icon name="star" size="18px" />
                <span class="text-italic">500 pontos</span>
              </div>
            </q-img>
          </q-card>
        </div>
      </div>
      <div class="row justify-center">
        <q-separator
          class="q-ma-xl bg-grey-5"
          size="0.1em"
          style="width: 75%"
        />
      </div>
      <div class="column justify-center q-my-md">
        <div class="text-h5 text-center q-mb-xl text-grey">
          Inspire-se em nossa comunidade!
        </div>
        <div class="row justify-evenly">
          <q-img
            src="https://i.pinimg.com/564x/65/81/1b/65811bb7bd63e209868559fca2e8f756.jpg"
            :ratio="1"
            width="100px"
            height="100px"
          >
            <img
              class="absolute-top-right q-ma-xs"
              src="https://www.svgrepo.com/show/381685/instagram.svg"
              alt=""
            />
          </q-img>
          <q-img
            src="https://i.pinimg.com/564x/51/ad/33/51ad33c7af432a9b0656f1216a94b4fa.jpg"
            :ratio="1"
            width="100px"
            height="100px"
          >
            <img
              class="absolute-top-right q-ma-xs"
              src="https://www.svgrepo.com/show/381685/instagram.svg"
              alt=""
            />
          </q-img>
          <q-img
            src="https://i.pinimg.com/750x/66/fa/d6/66fad60733bacdbb7a9a5605e59c299c.jpg"
            :ratio="1"
            width="100px"
            height="100px"
          >
            <img
              class="absolute-top-right q-ma-xs"
              src="https://www.svgrepo.com/show/381685/instagram.svg"
              alt=""
            />
          </q-img>
          <q-img
            src="https://i.pinimg.com/564x/86/26/86/8626868c5ea6d71514248b5f68ac7736.jpg"
            :ratio="1"
            width="100px"
            height="100px"
          >
            <img
              class="absolute-top-right q-ma-xs"
              src="https://www.svgrepo.com/show/381685/instagram.svg"
              alt=""
            />
          </q-img>
          <q-img
            src="https://i.pinimg.com/564x/6e/17/3f/6e173fca02e7376629552dd40b7652fd.jpg"
            :ratio="1"
            width="100px"
            height="100px"
          >
            <img
              class="absolute-top-right q-ma-xs"
              src="https://www.svgrepo.com/show/381685/instagram.svg"
              alt=""
            />
          </q-img>
          <q-img
            src="https://i.pinimg.com/564x/56/24/f1/5624f11e53ae0ba071cea9934e7e3058.jpg"
            :ratio="1"
            width="100px"
            height="100px"
          >
            <img
              class="absolute-top-right q-ma-xs"
              src="https://www.svgrepo.com/show/381685/instagram.svg"
              alt=""
            />
          </q-img>
          <q-img
            src="https://i.pinimg.com/564x/f9/e7/0a/f9e70ac335206fcf119966a068f4be62.jpg"
            :ratio="1"
            width="100px"
            height="100px"
          >
            <img
              class="absolute-top-right q-ma-xs"
              src="https://www.svgrepo.com/show/381685/instagram.svg"
              alt=""
            />
          </q-img>
        </div>
      </div>
    </section>

    <div class="dialogs">
      <q-dialog v-model="card">
        <q-carousel
          swipeable
          animated
          v-model="slide"
          thumbnails
          infinite
          style="width: 600px; height: 600px"
        >
          <q-carousel-slide :name="1" img-src="~assets/dress2.jpg" />
          <q-carousel-slide :name="2" img-src="~assets/dress.jpg" />
        </q-carousel>
      </q-dialog>

      <q-dialog v-model="video">
        <div>
          <q-video
            style="width: 540px; height: 360px"
            src="https://www.youtube.com/embed/PGikVJWbnPk"
          />
        </div>
      </q-dialog>

      <q-dialog v-model="toolbar">
        <q-card>
          <q-toolbar>
            <q-avatar>
              <img src="https://cdn.quasar.dev/logo-v2/svg/logo.svg" />
            </q-avatar>

            <q-toolbar-title
              ><span class="text-weight-bold">Quasar Shop</span>
              {{ $q.version }}</q-toolbar-title
            >

            <q-btn flat round dense icon="close" v-close-popup />
          </q-toolbar>

          <q-card-section>
            Colocar aqui uma visão 3d do produto.
          </q-card-section>
        </q-card>
      </q-dialog>
    </div>

    <q-page-sticky position="bottom-right" :offset="fabPos">
      <q-fab
        icon="chat_bubble"
        direction="up"
        color="accent"
        :disable="draggingFab"
        v-touch-pan.prevent.mouse="moveFab"
      >
        <q-card class="my-card absolute-bottom-right">
          <q-card-section>
            <div class="q-pa-sm row justify-start">
              <div style="width: 280px; max-width: 400px">
                <q-chat-message :text="['hey, how are you?']" sent />
                <q-chat-message :text="['doing fine, how r you?']" />
              </div>
            </div>
            <q-input outlined>
              <template v-slot:before>
                <q-avatar>
                  <img src="https://www.svgrepo.com/show/5319/user.svg" />
                </q-avatar>
              </template>

              <template v-slot:after>
                <q-btn round dense icon="send" />
              </template>
            </q-input>
          </q-card-section>
        </q-card>
      </q-fab>
    </q-page-sticky>
  </q-page>
</template>

<script>
export default {
  name: "Index",

  data() {
    return {
      card: false,
      slide: 1,
      video: false,
      toolbar: false,
      favorited: false,
      fabPos: [18, 18],
      draggingFab: false,
      tab: "description",
      color: "cyan",
      stock: "Apenas 2 no estoque!",
      size: "S-M",
      sizeoptions: ["S-M", "M-L", "L-XL"],
      ratingModel: 4,
      alert: {
        color: "accent",
        message: "50 pessoas vizualizaram este produto hoje",
        avatar: "https://www.svgrepo.com/show/5319/user.svg",
      },
      lorem: "Lorem ipsum dolor, sit amet consectetur adip.",
    };
  },

  created() {
    this.showSideNotif("left");
  },

  methods: {
    showNotif() {
      this.$q.notify({
        message: "Adicionado a lista de desejos.",
        color: "accent",
      });
    },

    showSideNotif(position) {
      const { color, message, avatar } = this.alert;

      this.$q.notify({
        color,
        message,
        position,
        avatar,
        timeout: 5000,
      });
    },

    moveFab(ev) {
      this.draggingFab = ev.isFirst !== true && ev.isFinal !== true;

      this.fabPos = [this.fabPos[0] - ev.delta.x, this.fabPos[1] - ev.delta.y];
    },
  },

  watch: {
    size: function () {
      if (this.size === "S-M") this.stock = "Apenas 2 no estoque!";
      else if (this.size === "M-L") this.stock = "Apenas 5 no estoque!";
      else if (this.size === "L-XL") this.stock = "";
    },
  },
};
</script>
<style scoped>
.my-card-image:hover {
  width: 200px !important;
}
</style>
