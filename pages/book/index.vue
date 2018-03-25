<template>
  <section class='confirm-booking'>
    <div class='content'>
      <div class='subsection'>
        <div style='margin: 25px 10px;'>
          <span class='subsection-title' style='vertical-align: middle;'>Booking Confirmation: Please fill in the following details.</span>
        </div>
        <div style='margin: 10px 0;'>
          <span class='confirm-reservation-id'>Reservation ID: </span>
          <input type='text' v-model='reservationID'></input>
        </div>
        <div style='margin: 10px 0;'>
          <span class='confirm-email'>Email: </span>
          <input type='text' v-model='email'></input>
        </div>
        <div style='margin: 10px 0;'>
          <span class='confirm-weight'>Luggage weight: </span>
          <select v-model="weightSelected">
            <option v-for="weight in weights" v-bind:value="weight.value">
              {{ weight.text }}
            </option>
          </select>
          kg
        </div>
        <div>
          <span class='confirm-mealpref'>Meal preference: </span>
          <select v-model="mealSelected">
            <option v-for="pref in mealprefs" v-bind:value="pref.value">
              {{ pref.text }}
            </option>
          </select>
        </div>
        <br>
        <button type='button' class='button--grey' style='margin-left: 15px;' @click='book()'>Confirm Booking</button>
        <nuxt-link class='button--grey' style='margin-left: 15px;' :to="{ path: `/search` }">Back to search</nuxt-link>
      </div>
    </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {
  asyncData ({ query }) {
    return {
      email: '',
      reservationID: '',
      weightSelected: '',
      weights: [
        {text: '0-24', value: 0},
        {text: '25-49', value: 1},
        {text: '50+', value: 2}
      ],
      mealSelected: '',
      mealprefs: [
        {text: 'Meat', value: 0},
        {text: 'Vegetarian', value: 1},
        {text: 'Vegan', value: 2},
        {text: 'Other', value: 3}
      ],
      query: query
    }
  },

  methods: {
    book () {
      let self = this
      let status

      axios.post(`api/book/confirm`, {
        headers: {
          'Content-Type': 'application/json'
        },
        data: {
          reservation_id: self.reservationID,
          email: self.email,
          luggages: self.weightSelected,
          meal_pref: self.mealSelected,
          flight_no: self.query.flight_no,
          airline: self.query.airline,
          date: self.query.date,
          seat_no: self.query.seat_no
        }
      })
        .then((res) => {
          alert(res.response.data)
          status = res.statusCode
        })
        .catch((e) => {
          alert(e.response.data)
          status = e.statusCode
        })

      if (status === 200) {
        axios.post(`api/book/update-seat`, {
          headers: {
            'Content-Type': 'application/json'
          },
          data: {
            flight_no: self.query.flight_no,
            airline: self.query.airline,
            date: self.query.date,
            seat_no: self.query.seat_no
          }
        })
          .then((res) => {
            alert(res.response.data)
          })
          .catch((e) => {
            alert(e.response.data)
          })
      }
    }
  },

  head () {
    return {
      title: 'Booking confirmation'
    }
  }
}
</script>

<style scoped>

</style>