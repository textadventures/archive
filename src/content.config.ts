import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const forum = defineCollection({
    loader: glob({
        pattern: "**/*.json",
        base: "./src/data/forums/samples",
    }),
    schema: z.object({
        Topic: z.object({
            TopicId: z.string(),
            ForumId: z.string(),
            Title: z.string(),
            LastUpdated: z.string(),
            ReplyCount: z.number(),
        }),
        Posts: z.array(z.object({
            PostId: z.string(),
            UserId: z.number(),
            Username: z.string(),
            AvatarUrl: z.optional(z.string().nullable()),
            UserAvatar: z.string().nullable(),
            UserGravatar: z.string().nullable(),
            EditableText: z.string(),
            EditableFormat: z.string(),
            HTML: z.string(),
            PostDate: z.string(),
            LastEditDate: z.string().nullable(),
            link: z.optional(z.string().nullable()),
        })),
    }),

});

export const collections = { forum };