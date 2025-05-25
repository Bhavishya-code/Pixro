-- CreateTable
CREATE TABLE "AiAgents" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "name" VARCHAR(100) NOT NULL,
    "firstMessage" TEXT NOT NULL,
    "prompt" TEXT NOT NULL,
    "model" VARCHAR(50) NOT NULL,
    "provider" VARCHAR(50) NOT NULL,
    "userId" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AiAgents_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_AiAgentsToUser" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL,

    CONSTRAINT "_AiAgentsToUser_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE INDEX "_AiAgentsToUser_B_index" ON "_AiAgentsToUser"("B");

-- AddForeignKey
ALTER TABLE "_AiAgentsToUser" ADD CONSTRAINT "_AiAgentsToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "AiAgents"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AiAgentsToUser" ADD CONSTRAINT "_AiAgentsToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
