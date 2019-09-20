<template>
    <div class="tree-item">
        <div class="tree-item-label" :class="{bold: isFolder}" @click="onItemClick">
            <span>
                <i v-if="isActive" class="tree-item-active-icon fa fa-chevron-right"></i>
                {{ item.name }}
            </span>



            <!--              <span v-if="isFolder">-->
            <!--                <i v-if="isOpen" class="fa fa-chevron-down"></i>-->
            <!--                <i v-else class="fa fa-chevron-right"></i>-->
            <!--            </span>-->

            <div >
                <div class="tree-item-path" v-for="n in depth"
                     :class="{ open: isOpen, closed: !isOpen, last: last }"
                     :style="{ left: `calc(-1.5em + ${n - 1} * (-1em + 1px))` }">
                </div>
            </div>

        </div>
        <div v-show="isOpen || depth === 1" v-if="isFolder">
            <TreeItem
                    class="tree-child"
                    v-for="(child, index) in item.children"
                    :key="index"
                    :depth="depth + 1"
                    :item="child"
                    :active-item="activeItem"
                    :last="index === (item.children.length - 1)"
                    @item="$emit('item', $event)"
            ></TreeItem>
        </div>
    </div>
</template>

<script>
  export default {
    name: 'TreeItem',
    props: {
      depth: {
        type: Number,
      },
      item: {
        type: Object,
      },
      activeItem: {
        type: Object,
      },
      last: {
        type: Boolean,
      },
    },
    data() {
      return {
        isOpen: false,
      };
    },
    computed: {
      isFolder() {
        return this.item.children && this.item.children.length;
      },
      classes() {
        return {
          open: this.isOpen,
        };
      },
      isActive() {
        return this.item && this.item === this.activeItem;
      },
    },
    methods: {
      onItemClick() {
        if (this.isFolder) {
          this.toggle();
        } else {
          this.$emit('item', this.item);
        }
      },
      toggle() {
        this.isOpen = !this.isOpen;
      },
    },
  };
</script>

<style scoped lang="scss">
    .tree-item-label {
        position: relative;
        cursor: pointer;
        white-space: nowrap;
    }

/*    .tree-item-active-icon {
        position: absolute;
        left: -24px;
    }*/

    .tree-item-path {
        height: 100%;
        width: 1em;

        top: -50%;
        overflow: hidden;
        position: absolute;

        border-width: 1px;
        border-color: rgba(0, 0, 0, .15);

        border-style: none none none solid;

        &:first-child {
            border-style: none none solid solid;
        }
    }

    .tree-child {
        margin-left: calc(1em - 1px);
    }

    .bold {
        font-weight: bold;
    }
</style>
