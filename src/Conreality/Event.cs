/* This is free and unencumbered software released into the public domain. */

using System;

namespace Conreality {

  /// <summary>Conreality event.</summary>
  public class Event {
    /// <summary>The event's ID.</summary>
    protected Int64 id;

    /// <summary>Constructor.</summary>
    public Event(Int64 id) {
      this.id = id;
    }

    /// <summary></summary>
    public Int64 GetID() {
      return this.id;
    }
  }
}
