package com.dianping.garden.biz.trend;

public enum Action implements com.site.web.mvc.Action {
   LIST("list"),

   REFRESH("refresh"),

   VIEW("view"),

   ;

   private String m_name;

   public static Action getByName(String name, Action defaultAction) {
      for (Action action : Action.values()) {
         if (action.getName().equals(name)) {
            return action;
         }
      }

      return defaultAction;
   }

   private Action(String name) {
      m_name = name;
   }

   @Override
   public String getName() {
      return m_name;
   }

   public boolean isRefresh() {
      return this == REFRESH;
   }

   public boolean isList() {
      return this == LIST;
   }

   public boolean isView() {
      return this == VIEW;
   }
}