<template>
  <section class="users-view">
    <div class="content">
      <div class="subsection">
        <div style="margin: 25px 10px;">
          <div class="user-username" style="padding: 10px 0 10px 10px; margin: 10px 0 10px 0;">Hello {{ user.first_name }} {{user.last_name}}!</div>

          <div class="container">
            <ul style="list-style-type: none; padding: 0; margin: 0;">
              <li v-if="user.access_level === 0" style="padding: 10px 5px; position: relative;">
                <nuxt-link class="button--grey" :to="{ path: `/users/${user.email}/updatephone`, params: { email: user.email }}">Update Phone Number</nuxt-link>
              </li>
              <li style="padding: 10px 5px; position: relative;">
                <nuxt-link class="button--grey" :to="{ path: `/users/${user.email}/search`, params: { email: user.email }}">Search For Flights</nuxt-link>
              </li>
              <li style="padding: 10px 5px; position: relative;">
                <nuxt-link class="button--grey" :to="{ path: `/users/${user.email}/reservations`, params: { email:user.email }}">Reservations</nuxt-link>
              </li>
              <li v-if="user.access_level > 0" style="padding: 10px 5px; position: relative;">
                <nuxt-link class="button--grey" :to="{ path: `/users/${user.email}/analytics`, params: { email:user.email }}">Data Analytics</nuxt-link>
              </li>
              <li style="padding: 10px 5px; position: relative;">
                <nuxt-link class="button--grey" to="/">Log Out</nuxt-link>
              </li>
              <li v-if="user.access_level === 0" style="padding: 10px 5px; position: relative;">
                <button type="button" class="button--grey" v-on:click="deleteAcct">Delete Account</button>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {
  asyncData ({ params, error }) {
    return axios.get('/api/users/' + params.email)
      .then((res) => {
        return { user: res.data }
      })
      .catch((e) => {
        error({ statusCode: 404, message: 'User not found' })
      })
  },
  methods: {
    deleteAcct () {
      let self = this
      var conf = confirm('Are you sure you want to delete your account and all reservations?')

      // confirm function delete account
      if (!conf) {
        return
      }

      axios.post('/api/users/deleteAcct', {
        headers:
          {
            'Content-Type': 'application/json'
          },
        data:
          {
            email: self.user.email
          }})
        .then((res) => {
          self.$nuxt.$router.replace({ path: '/' })
          alert('User deletion successful')
        })
        .catch((e) => {
          console.log(e)
          alert('Delete Account unsuccessful')
        })
    }
  },
  head () {
    return {
      title: `User: ${this.user.email}`
    }
  }
}
</script>

<style lang="stylus" scoped>
.users-view
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
    font-size 26px
    font-weight 500
  .title
    font-size 18px
    font-weight 500
  a
    text-decoration underline
    &:hover
      color #515ec4

</style>
