import { prisma } from ".";

export const getTests = () => {
    return prisma.test.findMany()
}