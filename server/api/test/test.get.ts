import {getTests} from '../../db/test'

export default defineEventHandler( async (event) => {
    return getTests()
})