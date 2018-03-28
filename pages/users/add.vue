<template>
  <section class="user-view">
  <div class="content">
    <div class="subsection">
    <form style="margin: 15px 15px;">
      <div style="margin: 10px 0;">
        <span class="user-email">Email*: </span>
        <input type="text" :value="email" v-model="email"/>
      </div>
      <div style="margin: 10px 0;">
        <span class="user-password">Password*: </span>
        <input type="password" v-model="password"/>
      </div>
      <div style="margin: 10px 0;">
        <span class="user-password">First Name*: </span>
        <input type="text" v-model="first_name"/>
      </div>
      <div style="margin: 10px 0;">
        <span class="user-password">Last Name*: </span>
        <input type="text" v-model="last_name"/>
      </div>
      <div style="margin: 10px 0;">
        <span class="user-password">Phone # (Optional): </span>
        <input type="text" v-model="phone_no"/>
      </div>

    </form>
    <button type="button" class="button--grey" @click="createCustomer">Create Customer Account</button>
    </div>
  </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {
  data () {
    return {
      email: '',
      password: '',
      first_name: '',
      last_name: '',
      phone_no: ''
    }
  },

  methods: {
    createCustomer () {
      let self = this

      if (self.email && self.password && self.first_name && self.last_name) {
        axios.post('/api/users/add', {
          headers:
            {
              'Content-Type': 'application/json'
            },
          data:
            {
              email: self.email,
              password: self.password,
              first_name: self.first_name,
              last_name: self.last_name,
              phone_no: self.phone_no
            }})
          .then((res) => {
            // res.data should contain the url for redirecting... bad practice
            self.$nuxt.$router.replace({ path: res.data })
          })
          .catch((e) => {
            console.log(e)
          })
      } else alert('Please fill in all required fields (*)')
    }
  },

  head () {
    return {
      title: `Add New User`
    }
  }
}
</script>

<style lang="stylus" scoped>
.user-view
  padding-top 0

.content
  position absolute
  width 100%

.subsection
  background-color #fff
  border-radius 2px
  margin 25px 0
  transition all .5s cubic-bezier(.55,0,.1,1)
  padding 10px 30px 10px 30px
  position relative
  line-height 20px
  .subsection-title
    margin 25px 10px
    font-size 26px
    font-weight 500
  .user-email
    font-size 24px
    font-weight 500
    color #707070
  .user-password
    font-size 24px
    font-weight 500
    color #707070
  .user-role
    font-size 24px
    font-weight 500
    color #707070
  a
    text-decoration underline
  &:hover
    color #515ec4

</style>
