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
  console.log(data);
  loading.value = false;

  data.value = data;
  console.log(data.value);
}

onMounted(() => {
  fetchData();
  console.log(data.value);
});
</script>

<template>
  <main>
    <div v-if="!loading && data">
      {{ data }}
    </div>

    <p v-if="loading">Still loading..</p>
    <p v-if="error"></p>
  </main>
</template>
