<template>
  <section class="user-view">
    <div class="content">
      <div class="subsection">
        <form style="margin: 15px 15px;">
            <div style="margin: 10px 0;">
              <span class="user-username" style="padding: 10px 0 10px 10px; margin: 10px 0 10px 0;">User: {{ user.email }}</span>
            </div>
            <div style="margin: 10px 0;">
              <span class="user-password">Phone Number: </span>
              <input type="text" v-model="phone_no" v-bind:placeholder= "user.phone_no" />
            </div>
        </form>
        <button type="button" class="button--grey" v-on:click="submitUpdate">Update Phone #</button>
        <nuxt-link class="button--grey" style="padding: 5px 20px; text-decoration: none;" :to="{ path: `/users/${user.email}`, params: { email: user.email }}">Back</nuxt-link>
      </div>
    </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {
  asyncData ({ params, error }) {
    return axios.get('/api/users/customer/' + params.email)
      .then((res) => {
        return { user: res.data }
      })
      .catch((e) => {
        error({ statusCode: 404, message: 'User not found' })
      })
  },

  data () {
    return {
      phone_no: ''
    }
  },

  methods: {
    submitUpdate () {
      let self = this
      let phoneNo = self.phone_no.replace(/\D/g, '')

      if (phoneNo.length < 1) {
        alert('Please enter a phone number')
        return
      }

      axios.post('/api/users/updatephone', {
        headers:
          {
            'Content-Type': 'application/json'
          },
        data:
          {
            email: self.user.email,
            phone_no: phoneNo
          }})
        .then((res) => {
          // res.data should contain the url for redirecting... bad practice
          self.$nuxt.$router.replace({ path: res.data })
        })
        .catch((e) => {
          console.log(e)
          alert('Phone number has already been registered. Please enter a unique phone number.')
        })
    }
  },

  head () {
    return {
      title: `Update User: ${this.user.email}`
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
  .user-username
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
