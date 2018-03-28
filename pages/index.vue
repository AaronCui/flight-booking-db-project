<template>
  <section class="container">
    <div>
    <Logo />
      <h1 class="title">
        Flights R' Us
      </h1>
      <div style="margin: 10px 0;">
        <span class="user-email">Email: </span>
        <input type="text" :value="email" v-model="email"/>
      </div>
      <div style="margin: 10px 0;">
        <span class="user-password">Password: </span>
        <input type="password" v-model="password"/>
      </div>
      <div class="links">
        <button type="button" style="padding: 10px 20px; text-decoration: none;" @click="login()">Login</button>
      </div>
      <nuxt-link class="button--grey" style="padding: 5px 20px; text-decoration: none;" to="/users/add">Add User</nuxt-link>
    </div>
  </section>
</template>

<script>
import Logo from '~/components/Logo.vue'
import axios from '~/plugins/axios'

export default {
  data () {
    return {
      email: '',
      password: ''
    }
  },

  methods: {
    login () {
      let self = this
      console.log(self.email)
      console.log(self.password)

      if (self.email && self.password) {
        axios.post('/api/users/auth', {email: self.email, password: self.password})
          .then((res) => {
            // res.data should contain the url for redirecting... bad practice
            console.log(res.data)
            // this.$store.email = self.email
            self.$nuxt.$router.replace({path: res.data})

            // self.$nuxt.$router.replace({path: '/main/' + res.data})
          })
          .catch((e) => {
            console.log(e)
            alert('Incorrect email/password')
          })
      } else alert('Please enter both email and password')
    }
  },

  head () {
    return {
      title: `Login`
    }
  },

  components: {
    Logo
  }
}
</script>

<style lang="stylus" scoped>
.container
  min-height 90vh
  display flex
  justify-content center
  align-items center
  text-align center

@media (min-height 1080px)
  .container
    margin-top -200px

.title
  font-family "Quicksand", "Source Sans Pro", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif /* 1 */
  display block
  font-weight 300
  font-size 100px
  color #35495e
  letter-spacing 1px

.subtitle
  font-weight 300
  font-size 42px
  color #526488
  word-spacing 5px
  padding-bottom 15px

.links
  padding-top 10px
  padding-bottom 15px

@media (max-width 860px)
  .title
    font-size 64px
  .subtitle
    font-size 32px

@media (max-width 860px)
  .links
    .link
      width 50%
      margin-bottom 15px
      display relative
</style>
