<script setup>
import { ref, onMounted } from "vue";

const data = ref(null);
const loading = ref(true);
const error = ref(null);

function fetchData() {
  loading.value = true;
  // I prefer to use fetch
  // you can use use axios as an alternative
  return fetch("/database/test.json", {
    method: "get",
    headers: {
      "content-type": "application/json",
    },
  })
    .then((res) => {
      if (!res.ok) {
        const error = new Error(res.statusText);
        error.json = res.json();
        throw error;
      }

      return res.json();
    })
    .then((json) => {
      // set the response data
      data.value = json;
    })
    .catch((err) => {
      error.value = err;
      if (err.json) {
        return err.json.then((json) => {
          error.value.message = json.message;
        });
      }
    })
    .then(() => {
      loading.value = false;
    });
}

onMounted(() => {
  fetchData();
});
</script>

<template>
  <main>
    <ul v-if="!loading && data">
      {{
        data
      }}
    </ul>

    <p v-if="loading">Still loading..</p>
    <p v-if="error"></p>
  </main>
</template>
