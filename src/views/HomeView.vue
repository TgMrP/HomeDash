<script setup>
import { ref, onMounted } from "vue";

const data = ref(null);
const loading = ref(true);
const error = ref(null);

async function fetchData() {
  loading.value = true;
  const response = await fetch("/database/test.json");
  const data = await response.json();
  // waits until the request completes...
  console.log(data.test);
  data.value = data;
  loading.value = false;
}

onMounted(() => {
  fetchData();
});
</script>

<template>
  <main>
    <div v-if="!loading && data.test">data: {{ data.test }}</div>

    <p v-if="loading">Still loading..</p>
    <p v-if="error"></p>
  </main>
</template>
