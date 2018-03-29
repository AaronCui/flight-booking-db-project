<template>
  <section class="reservations-view">
    <div class="content">
      <div class="subsection">
        <div style="margin: 25px 10px;">
          <span class="subsection-title" style="vertical-align: middle;">Reservations</span>
        </div>
        <ul style="list-style-type: none; padding: 0; margin: 0;">
          <li v-for="(reservation, index) in reservations" :key="index" style="padding: 10px 20px; margin: 0 25px; position: relative;">
            <div>Reservation # :"{{ reservation.reservation_id }}"</div>
            <div>
              <span style="color:green;">Route: {{ reservation.takesoff_airport }} --> {{ reservation.landsat_airport}}</span>
              <span style="color:blue;">Date: {{ reservation.date }}</span>
              <button type="button" style="padding: 10px 20px; text-decoration: none;" @click="deleteReservation(reservation.reservation_id, reservation.email)">
                Cancel Reservation
              </button>
            </div>
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
      return axios.get('/api/reservations/' + params.email)
        .then((result) => {
          return { reservations: result.data }
        })
        .catch((e) => {
          alert('No reservations to show.')
          self.$nuxt.$router.replace({ path: `/users/${params.email}/` })
        })
    },
    data () {
      return {
        rows: [],
        columns: []
      }
    },

    methods: {
      deleteReservation (reservationID, email) {
        email = email.trim()
        axios.get(`/api/reservations/cancel/` + reservationID, {
          headers: {
            'Content-Type': 'application/json'
          },
          params: {
            reservation_id: reservationID
          }
        })
          .then((result) => {
            alert('Reservation' + reservationID + 'deleted.')
            console.log(result)
            self.$nuxt.$router.replace({ path: `/users/${email}/reservations/` })
          })
          .catch((e) => {
            alert(e.response)
          })
      }
    },

    head () {
      return {
        title: 'Manage Reservations'
      }
    }
  }
</script>

<style scoped>

</style>
