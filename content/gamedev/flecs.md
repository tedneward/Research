title=Flecs
tags=gamedev, native, entity component system
summary=A fast and lightweight Entity Component System that lets you build games and simulations with millions of entities.
~~~~~~

[Website](https://www.flecs.dev/) | [Source](https://github.com/SanderMertens/flecs) | [Flecs-Hub](https://github.com/flecs-hub): A collection of Flecs projects, modules and examples

## Show me the code!

[](https://github.com/SanderMertens/flecs#show-me-the-code)

C99 example:

    typedef struct {
        float x, y;
    } Position, Velocity;

    void Move(ecs_iter_t *it) {
        Position *p = ecs_field(it, Position, 0);
        Velocity *v = ecs_field(it, Velocity, 1);

        for (int i = 0; i < it->count; i++) {
            p[i].x += v[i].x;
            p[i].y += v[i].y;
        }
    }

    int main(int argc, char *argv[]) {
        ecs_world_t *ecs = ecs_init();

        ECS_COMPONENT(ecs, Position);
        ECS_COMPONENT(ecs, Velocity);

        ECS_SYSTEM(ecs, Move, EcsOnUpdate, Position, Velocity);

        ecs_entity_t e = ecs_insert(ecs,
            ecs_value(Position, {10, 20}),
            ecs_value(Velocity, {1, 2}));

        while (ecs_progress(ecs, 0)) { }
    }

Same example in C++:

    struct Position {
        float x, y;
    };

    struct Velocity {
        float x, y;
    };

    int main(int argc, char *argv[]) {
        flecs::world ecs;

        ecs.system<Position, const Velocity>()
            .each([](Position& p, const Velocity& v) {
            p.x += v.x;
            p.y += v.y;
        });

        auto e = ecs.entity()
            .insert([](Position& p, Velocity& v) {
            p = {10, 20};
            v = {1, 2};
        });

        while (ecs.progress()) { }
    }

