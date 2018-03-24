<template>
  <section class="view-seats">
    <div class="content">
      <div class="subsection">
        <div style="margin: 25px 10px;">
          <span class="subsection-title" style="vertical-align: middle;">Available seats</span>
        </div>
        <ul style="list-style-type: none; padding: 0; margin: 0;">
          <li v-for="(seat, index) in seats" :key="index" style="padding: 10px 20px; margin: 0 25px; position: relative;">
            <nuxt-link :to="{ path: `/users}`,}">
              {{ seat.flightno }}
            </nuxt-link>
          </li>
        </ul>
      </div>
    </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {
  asyncData ({ params, error }) {
    return axios.get(`/api/search/${params.flightno}/${params.airline}/${params.date}`)
      .then((res) => {
        return { seats: res.data }
      })
      .catch((e) => {
        error({ statusCode: 404, message: 'impossible' }) // TODO - change error message
      })
  }
}
</script>

<style scoped>

</style>