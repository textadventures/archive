import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const PostSchema = z.object({
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
});

const getForumCollection = (forumId: string) => defineCollection({
    loader: glob({
        pattern: "**/*.json",
        base: `./src/data/forums/${forumId}`,
    }),
    schema: z.object({
        Topic: z.object({
            TopicId: z.string(),
            ForumId: z.string(),
            Title: z.string(),
            LastUpdated: z.string(),
            ReplyCount: z.number(),
        }),
        Posts: z.array(PostSchema),
    }),
});

export const allForums = [ "design", "games", "general", "quest", "questkit", "samples", "site", "squiffy" ];
const design = getForumCollection("design");
const games = getForumCollection("games");
const general = getForumCollection("general");
const quest = getForumCollection("quest");
const questkit = getForumCollection("questkit");
const samples = getForumCollection("samples");
const site = getForumCollection("site");
const squiffy = getForumCollection("squiffy");

export const collections = { design, games, general, quest, questkit, samples, site, squiffy };

export type Post = z.infer<typeof PostSchema>;