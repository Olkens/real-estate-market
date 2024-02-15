<template>
    <div>
        {{ data }}
    </div>
</template>
<script setup>

const { data } = await useFetch('/api/test/test')

</script>
<style lang="">

</style>